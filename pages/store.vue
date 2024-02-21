<template>
  <UContainer>
    <UCard>
      <template #header>
        <div class="flex items-center gap-4">
          <div
            class="h-20 w-20 flex items-center justify-center p-2 border rounded-lg border-gray-300 dark:border-gray-700"
          >
            <img :src="image" alt="Store Image" class="object-contain" />
          </div>
          <h1 class="text-center">
            {{ store?.companyName.toUpperCase() }}
          </h1>
        </div>
      </template>
      <UPopover :popper="{ placement: 'bottom-start' }">
        <UButton
          color="white"
          label="Store Information"
          trailing-icon="i-heroicons-chevron-down-20-solid"
        />
        <template #panel>
          <UTable :rows="storeInfo" :columns="columns" />
        </template>
      </UPopover>

      <div class="h-full"></div>
      <div v-if="store?.isApproved">
        <div>
          <UButton label="Open" @click="isOpen = true" />
          <UPopover :popper="{ placement: 'bottom-start' }">
            <UButton icon="i-heroicons-calendar-days-20-solid">
              {{ format(selected.start, "d MMM, yyy") }} -
              {{ format(selected.end, "d MMM, yyy") }}
            </UButton>

            <template #panel="{ close }">
              <div
                class="flex items-center divide-x divide-gray-200 dark:divide-gray-800"
              >
                <div class="flex flex-col py-4">
                  <UButton
                    v-for="(range, index) in ranges"
                    :key="index"
                    :label="range.label"
                    color="gray"
                    variant="ghost"
                    class="rounded-none px-6"
                    :class="[
                      isRangeSelected(range.duration)
                        ? 'bg-gray-100 dark:bg-gray-800'
                        : 'hover:bg-gray-50 dark:hover:bg-gray-800/50',
                    ]"
                    @click="selectRange(range.duration)"
                  />
                </div>

                <DatePicker v-model="selected" @close="close" />
              </div>
            </template>
          </UPopover>

          <UModal v-model="isOpen" class="p-2">
            <UCard
              :ui="{
                ring: '',
                divide: 'divide-y divide-gray-100 dark:divide-gray-800',
              }"
            >
              <template #header>
                <h1>Create a Sale</h1>
              </template>

              <UForm :validate="validateWithVuelidate" :state="form">
                <div class="grid grid-cols-2 gap-7">
                  <div>
                    <UFormGroup label="Sale Title" name="name">
                      <UInput
                        placeholder="%50 off for all items semtemper offer"
                        v-model="form.name"
                      />
                    </UFormGroup>
                    <UFormGroup label="Description" name="description">
                      <UInput
                        placeholder="Buy 1, Get 2 Free! "
                        v-model="form.description"
                      />
                    </UFormGroup>
                    <UFormGroup label="Percentage" name="percentage">
                      <UInput placeholder="%50" v-model="form.percentage" />
                    </UFormGroup>
                    <UFormGroup label="Products" name="products">
                      <UInput
                        placeholder="Small size coffees"
                        v-model="form.products"
                      />
                    </UFormGroup>
                  </div>
                </div>
              </UForm>
            </UCard>
          </UModal>
        </div>
      </div>
    </UCard>
  </UContainer>
</template>

<script setup lang="ts">
const user = useSupabaseUser();
import { format, isSameDay, sub, type Duration } from "date-fns";

const isOpen = ref(false);
const storesResponse = await useFetch("/api/prisma/get-all-stores");
const stores = storesResponse.data.value;

const store = stores?.find((userId) => userId ?? "" === user.value?.id ?? "");
const image = store?.url;
const status = store?.isApproved ? "Approved" : "Waiting";
const { data: category } = await useFetch(
  `/api/prisma/get-category-by-id/${store?.categoryId}`
);
const { data: companyType } = await useFetch(
  `/api/prisma/get-category-by-id/${store?.companyTypeId}`
);

const storeInfo = [
  { property: "Status", value: status },
  { property: "Name-Surname", value: store?.nameSurname },
  { property: "Category", value: category.value?.name },
  { property: "Company Type", value: companyType.value?.name },
  { property: "City", value: store?.city },
  { property: "District", value: store?.district },
  { property: "Address", value: store?.addressLine },
  { property: "Phone", value: store?.phone },
];

const columns = [
  { key: "property", label: "Property" },
  { key: "value", label: "Value" },
];

const form = reactive({
  name: "",
  description: "",
  percentage: "",
  products: "",
});
const ranges = [
  { label: "Last 7 days", duration: { days: 7 } },
  { label: "Last 14 days", duration: { days: 14 } },
  { label: "Last 30 days", duration: { days: 30 } },
];
const selected = ref({ start: sub(new Date(), { days: 14 }), end: new Date() });

function isRangeSelected(duration: Duration) {
  return (
    isSameDay(selected.value.start, sub(new Date(), duration)) &&
    isSameDay(selected.value.end, new Date())
  );
}

function selectRange(duration: Duration) {
  selected.value = { start: sub(new Date(), duration), end: new Date() };
}
</script>
