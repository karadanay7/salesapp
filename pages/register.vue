<template>
  <Loading v-if="isLoading" />
  <UContainer class="flex justify-center items-center pt-10">
    <UCard class="items-center justify-center w-full max-w-[700px]">
      <template #header>
        <h1 class="text-center">Store Registration</h1>
      </template>
      <UForm :validate="validateWithVuelidate" :state="form" @submit="onSubmit">
        <div class="grid grid-cols-2 gap-7">
          <div class="grid1 flex flex-col gap-2">
            <UFormGroup label="Name-Surname" name="nameSurname">
              <UInput
                v-model="form.nameSurname"
                name="NameSurname"
                placeholder="Name Surname"
              />
            </UFormGroup>

            <UFormGroup label="Company Type" name="companyType">
              <USelect
                v-model="form.companyType"
                :options="companyTypes"
                option-attribute="name"
                placeholder="Company Type"
              ></USelect>
            </UFormGroup>
            <UFormGroup label="ID/TAX Number" name="idTaxNo">
              <UInput
                v-model="form.idTaxNo"
                type="text"
                placeholder="ID/TAX number"
              />
            </UFormGroup>
            <UFormGroup label="Company Trade Name " name="companyName">
              <UInput
                v-model="form.companyName"
                placeholder="Company Trade Name"
              />
            </UFormGroup>
            <UFormGroup label="City" name="city">
              <USelect
                @change="loadDistricts"
                v-model="form.city"
                :options="cities"
                option-attribute="name"
                value-attribute="id"
                placeholder="City"
              ></USelect
            ></UFormGroup>
          </div>
          <div class="grid2 flex flex-col gap-2">
            <UFormGroup label="District" name="district">
              <USelect
                v-model="form.district"
                :options="districts"
                option-attribute="name"
                placeholder="Select District"
              ></USelect
            ></UFormGroup>
            <UFormGroup label="Address Line " name="addressLine">
              <UInput
                v-model="form.addressLine"
                type="text"
                placeholder="Address line"
              />
            </UFormGroup>
            <UFormGroup label="Phone" name="phone">
              <UInput
                v-model="form.phone"
                type="phone"
                placeholder="05__ ___ __ __"
              />
            </UFormGroup>

            <UFormGroup label="Category" name="category">
              <USelect
                v-model="form.category"
                :options="categories"
                option-attribute="name"
                placeholder="Select District"
              ></USelect
            ></UFormGroup>

            <!-- Image Upload -->
          </div>
        </div>

        <div
          class="relative w-full h-52 border-2 border-dashed flex flex-col justify-center items-center overflow-hidden mt-4"
        >
          <div v-if="previewSrc" class="overflow-hidden flex flex-col">
            <div>
              <img
                :src="previewSrc"
                alt="Image Preview"
                class="w-full h-full object-contain p-2"
              />
            </div>
            <div>
              <Icon
                name="fa:close"
                size="70"
                class="text-red-500 absolute"
                @click="handleFileChange"
              />
            </div>
          </div>
          <div
            v-else
            class="flex flex-col justify-center items-center w-full h-full"
          >
            <h3 class="text-xl">Add Store Image</h3>
            <div>
              <Icon class="" name="flat-color-icons:add-image" size="70" />
            </div>
            <h2 class="text-center text-lg mb-2">
              Drop the image here, or
              <span class="text-blue-500 cursor-pointer"> browse </span>
            </h2>

            <input
              type="file"
              accept="image/*"
              @change="previewImage"
              class="opacity-0 cursor-pointer absolute inset-0 w-full h-full"
              ref="previewFileInput"
            />
          </div>
        </div>
        <div class="flex items-center justify-center pt-4">
          <UButton type="submit" color="primary">
            Apply & Get Password
          </UButton>
        </div>
      </UForm></UCard
    ></UContainer
  >
</template>

<script setup lang="ts">
import type { FormSubmitEvent } from "#ui/types";

import useVuelidate from "@vuelidate/core";
import {
  helpers,
  maxLength,
  minLength,
  numeric,
  required,
} from "@vuelidate/validators";
const route = useRoute();
const err = ref("");
const supabase = useSupabaseClient();
const user = useSupabaseUser();

definePageMeta({ middleware: "auth" });
watchEffect(() => {
  if (route.fullPath == "/register" && !user.value) {
    return navigateTo("/auth");
  }
});

const form = reactive({
  nameSurname: "",
  companyType: "",
  idTaxNo: "",
  companyName: "",
  city: "",
  district: "",
  addressLine: "",
  phone: "",
  category: "",
  photo: "",
});
const v = useVuelidate(
  {
    nameSurname: {
      required: helpers.withMessage("This field is required", required),
      minLength: minLength(6),
    },
    companyType: {
      required: helpers.withMessage("This field is required", required),
    },
    idTaxNo: {
      required: helpers.withMessage("This field is required", required),
      numeric: numeric,
    },
    companyName: {
      required: helpers.withMessage("This field is required", required),
      minLength: minLength(6),
    },
    city: {
      required: helpers.withMessage("This field is required", required),
    },
    district: {
      required: helpers.withMessage("This field is required", required),
    },
    addressLine: {
      required: helpers.withMessage("This field is required", required),
    },
    phone: {
      required: helpers.withMessage("This field is required", required),
      numeric: numeric,
      minLength: minLength(11),
      maxLength: maxLength(11),
    },
    category: {
      required: helpers.withMessage("This field is required", required),
    },
    photo: {
      required: helpers.withMessage("This field is required", required),
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

type District = {
  area: number;
  id: number;
  name: string;
  population: number;
  province: string;
};

type CityResponse = {
  id: string;
  districts: District[];
};

const districts = ref<District[]>([]);
const cities = ref<CityResponse[]>([]);
const previewSrc = ref<string | ArrayBuffer | null>(null);
const isLoading = ref(false);
const files = ref<FileList | null>(null);
const latestPath = ref("");
const companyType = ref("");
const city = ref("");
const selectedDistrict = ref("");

const citiesResponse = await useFetch<{ data: (typeof Option)[] }>(
  "https://turkiyeapi.dev/api/v1/provinces"
);
if (citiesResponse.data.value) {
  cities.value = citiesResponse.data.value.data as unknown as CityResponse[];
}

const loadDistricts = async (evt: { target: { _value: any } }) => {
  if (city) {
    const districtsResponse: Awaited<{
      data: {
        value: {
          data: {
            districts: District[];
          };
        };
      };
    }> = await useFetch(
      `https://turkiyeapi.dev/api/v1/provinces/${evt.target._value}`
    );

    if (districtsResponse.data && districtsResponse.data.value) {
      districts.value = districtsResponse.data?.value?.data?.districts ?? [];
    } else {
      console.error("Invalid districts response:", districtsResponse);
    }
  } else {
    // Reset districts if no city is selected
    districts.value = [];
    // Change here
  }
};

const companyTypes = [
  { id: 1, name: "Incorporated" },
  { id: 2, name: "Limited" },
  { id: 3, name: "Sole Proprietorship" },
  { id: 4, name: "Other" },
];

const categories = [
  { id: 1, name: "Clothing" },
  { id: 2, name: "Electronics" },
  { id: 3, name: "Home and Furniture" },
  { id: 4, name: "Books and Stationery" },
  { id: 5, name: "Sports and Outdoors" },
  { id: 6, name: "Coffee Shops" },
  { id: 7, name: "Restaurants" },
  { id: 8, name: "Spa & Massage" },
  { id: 9, name: "Beauty" },
  { id: 10, name: "Grocery Stores" },
  { id: 11, name: "Toys and Games" },
  { id: 12, name: "Jewelry and Accessories" },
  { id: 13, name: "Automotive" },
  { id: 14, name: "Pet Supplies" },
  { id: 15, name: "Tech and Gadgets" },
  { id: 16, name: "Health and Fitness" },
  { id: 17, name: "Music and Instruments" },
  { id: 18, name: "Arts and Crafts" },
  { id: 19, name: "Baby and Kids" },
  { id: 20, name: "Footwear" },
];
const previewImage = (evt: { target: { files: FileList } }) => {
  const file = evt.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = () => {
      previewSrc.value = reader.result;
    };
    reader.readAsDataURL(file);
    files.value = evt.target.files; // Assign files.value here
  }
};

const handleFileChange = () => {
  previewSrc.value = null; // Reset previewSrc
};
const uploadImage = async (evt: { target: { files: FileList } }) => {
  try {
    // Ensure files.value is not null
    if (!files.value) {
      throw new Error("No file selected");
    }

    const file = files.value[0];
    if (!file) {
      throw new Error("Invalid file");
    }

    const fileExt = file.name.split(".").pop();
    const fileName = `${Math.random()}.${fileExt}`;
    const filePath = `images/${fileName}`;

    const { data: response, error: uploadError } = await supabase.storage
      .from("SaleSpot")
      .upload(filePath, file);

    if (uploadError) {
      throw new Error(uploadError.message);
    }

    // Ensure response has a path property
    if (response?.path) {
      latestPath.value = response.path.toString(); // Assigning the latest path
      console.log(response);
    } else {
      throw new Error("Uploaded file path not found");
    }
  } catch (error) {
    alert(error.message);
    console.log();
  }
};

const onRegister = async () => {
  await useFetch("/api/prisma/register/", {
    method: "POST",
    body: {
      nameSurname: form.nameSurname,
      companyType: form.companyType,
      idTaxNo: form.idTaxNo,
      companyName: form.companyName,
      city: form.city,
      district: form.district,
      addressLine: form.addressLine,
      phone: form.phone,
      category: form.category,
      url: latestPath,
    },
  });
};

async function onSubmit(event: FormSubmitEvent<any>) {
  return navigateTo("/");
}
</script>
