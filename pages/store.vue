<template>
  <Loading v-if="isLoading" />
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
      <div class="flex flex-col gap-4">
        <div>
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
        </div>

        <div v-if="store?.isApproved">
          <div>
            <UButton label="Create a Sale" @click="isOpen = true" />

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

                <UForm
                  :validate="validateWithVuelidate"
                  :state="form"
                  :validate-on="change"
                >
                  <div class="flex flex-col items-center justify-center">
                    <div class="w-56 flex flex-col gap-2">
                      <UFormGroup label="Sale Title" name="name">
                        <UInput
                          placeholder="September Offer"
                          v-model="form.name"
                        />
                      </UFormGroup>
                      <UFormGroup label="Sale Type">
                        <USelectMenu
                          v-model="saleType"
                          :options="descriptionOrPercentage"
                      /></UFormGroup>

                      <UFormGroup
                        v-if="saleType === 'Description'"
                        label="Description"
                        name="description"
                      >
                        <UInput
                          placeholder="Buy 1, Get 2 Free! "
                          v-model="form.description"
                        />
                      </UFormGroup>

                      <UFormGroup
                        v-if="saleType === 'Percentage'"
                        label="Percentage"
                        name="percentage"
                      >
                        <UInput
                          placeholder="%__ Only number such as 50"
                          v-model="form.percentage"
                        />
                      </UFormGroup>

                      <UFormGroup label="Products" name="products">
                        <UInput
                          placeholder="Small size coffees"
                          v-model="form.products"
                        />
                      </UFormGroup>
                      <UFormGroup label="Available At" name="available">
                        <UInput
                          placeholder="In place / Getir / Everywhere"
                          v-model="form.available"
                        />
                      </UFormGroup>
                      <UFormGroup label="Sale Days" name="timeSpanDays">
                        <UPopover :popper="{ placement: 'bottom-start' }">
                          <UButton
                            icon="i-heroicons-calendar-days-20-solid"
                            class="w-full"
                          >
                            {{ format(selected.start, " d MMM") }} -
                            {{ format(selected.end, " d MMM") }}
                          </UButton>

                          <template #panel="{ close }">
                            <div
                              class="flex items-center divide-x divide-gray-200 dark:divide-gray-800"
                            >
                              <DatePicker v-model="selected" @close="close" />
                            </div>
                          </template>
                        </UPopover>
                      </UFormGroup>
                      <UButton
                        @click="onRegister"
                        color="primary"
                        class="w-full flex items-center justify-center"
                        :disabled="v.$invalid"
                      >
                        Register
                      </UButton>
                    </div>
                  </div>
                </UForm>
              </UCard>
            </UModal>
          </div>
        </div>
        <div
          class="flex gap-4 items-start flex-wrap justify-center md:justify-start"
        >
          <div v-for="sale in storeSales" :key="sale.id">
            <Sale
              :name="sale.name"
              :description="sale.description"
              :percentage="sale.percentage"
              :products="sale.products"
              :addressLine="store?.addressLine"
              :timespanDays="
                formatDateRange(sale.timespanStart, sale.timespanEnd)
              "
              :timespanHours="
                formatHourRange(sale.timespanStart, sale.timespanEnd)
              "
              :available="sale.available"
              :url="sale.url"
            />
          </div>
        </div>
      </div>
    </UCard>
  </UContainer>
</template>

<script setup lang="ts">
const user = useSupabaseUser();
import useVuelidate from "@vuelidate/core";
import {
  helpers,
  maxLength,
  maxValue,
  minLength,
  minValue,
  numeric,
  required,
  requiredIf,
} from "@vuelidate/validators";
import { add, format } from "date-fns";
const isLoading = ref(false);
const isOpen = ref(false);
const saleType = ref("Description");
const descriptionOrPercentage = ["Description", "Percentage"];

const { data: stores } = await useFetch("/api/prisma/get-all-stores");

const store = computed(() =>
  stores.value?.find((store) => store.userId === user.value?.id)
);

const { data: sales } = await useFetch("/api/prisma/get-all-sales");
const storeSales = computed(() =>
  (sales.value ?? []).filter(
    (sale) =>
      store.value?.id && sale.storeId && sale.storeId === store.value?.id
  )
);

const image = store.value?.url;
const status = store.value?.isApproved ? "Approved" : "Waiting";
const { data: category } = await useFetch(
  `/api/prisma/get-category-by-id/${store.value?.categoryId}`
);
const { data: companyType } = await useFetch(
  `/api/prisma/get-category-by-id/${store.value?.companyTypeId}`
);
const formatDateRange = (start, end) => {
  const formattedStart = format(start, "d MMM");
  const formattedEnd = format(end, "d MMM");
  return `${formattedStart} - ${formattedEnd}`;
};
const formatHourRange = (start, end) => {
  const formattedStart = format(start, "HH:mm");
  const formattedEnd = format(end, "HH:mm");
  return `${formattedStart} - ${formattedEnd}`;
};

const storeInfo = [
  { property: "Status", value: status },
  { property: "Name-Surname", value: store.value?.nameSurname },
  { property: "Category", value: category.value?.name },
  { property: "Company Type", value: companyType.value?.name },
  { property: "City", value: store.value?.city },
  { property: "District", value: store.value?.district },
  { property: "Address", value: store.value?.addressLine },
  { property: "Phone", value: store.value?.phone },
];

const columns = [
  { key: "property", label: "Property" },
  { key: "value", label: "Value" },
];
// Validation
type FormType = {
  name: string;
  description: string;
  percentage: string;
  products: string[];
  available: string[];
};

const form: FormType = reactive({
  name: "",
  description: "",
  percentage: "",
  products: [],
  available: [],
});

const v = useVuelidate(
  {
    name: {
      required: helpers.withMessage("This field is required", required),
      minLength: minLength(6),
      maxLength: maxLength(27),
    },
    description: {
      requiredIf: helpers.withMessage(
        "Please provide either Description or Percentage",
        requiredIf(() => !form.percentage)
      ),
      minLength: minLength(6),
    },
    percentage: {
      requiredIf: helpers.withMessage(
        "Please provide either Description or Percentage",
        requiredIf(() => !form.description)
      ),
      numeric: helpers.withMessage("Percentage should be a number", numeric),
      minValue: minValue(5),
      maxValue: maxValue(70),
    },

    available: {
      required: helpers.withMessage("This field is required", required),
      minLength: minLength(3),
    },
  },
  form
);
function validateWithVuelidate() {
  v.value.$touch();
  return v.value.$errors.map((error) => ({
    path: error.$propertyPath,
    message: error.$message as string,
  }));
}

defineExpose({
  validate: async () => await v.value.validate(),
});

watch(form, validateWithVuelidate, { deep: true });

// Date -time picker
const selected = ref({ start: new Date(), end: add(new Date(), { days: 7 }) });
const timespanStart = selected.value.start.toISOString();
const timespanEnd = selected.value.start.toISOString();
//
watch(saleType, (newValue, oldValue) => {
  if (newValue !== oldValue) {
    // Reset the form fields based on the new saleType selection
    if (newValue === "Description") {
      // Reset percentage field
      form.percentage = "";
    } else if (newValue === "Percentage") {
      // Reset description field
      form.description = "";
    }
  }
});
//   Post the form
// Function to check if the form is valid before registering
const onRegister = async () => {
  isLoading.value = true;

  await $fetch("/api/prisma/add-sale/", {
    method: "POST",
    body: {
      storeId: store.value?.id,
      name: form.name,
      description: form.description,
      percentage: Number(form.percentage),
      products: [form.products],
      timespanStart: timespanStart,
      timespanEnd: timespanEnd,
      url: image,
      available: [form.available],
    },
  });
  form.name = "";
  form.description = "";
  form.percentage = "";
  form.products = [];
  form.available = [];
  isLoading.value = false;
  isOpen.value = false;
  navigateTo("/store");

  // Handle form validat
};
//
</script>
