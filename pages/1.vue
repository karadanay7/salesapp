<template>
  <div class="bg-red-50 min-h-screen flex flex-col items-center font-index p-8">
    <h1 class="text-2xl font-semibold mb-6 text-gray-900">Registration</h1>

    <!-- Step 1: Company Information -->
    <form
      v-if="currentStep === 1"
      @submit.prevent="nextStep"
      class="w-full max-w-md bg-white rounded-md p-4"
    >
      <h1 class="text-center font-semibold pb-2 text-gray-600">
        Company Informations
      </h1>
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600"
          >Company Name</label
        >
        <input
          v-model="companyName"
          type="text"
          class="mt-1 p-2 w-full border rounded-md"
          required
        />
      </div>
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600"
          >Company Type</label
        >
        <input
          v-model="companyType"
          type="text"
          class="mt-1 p-2 w-full border rounded-md"
          required
        />
      </div>
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600"
          >Tax Number</label
        >
        <input
          v-model="taxNumber"
          type="text"
          class="mt-1 p-2 w-full border rounded-md"
          required
        />
      </div>

      <div class="mb-4">
        <button
          type="submit"
          class="bg-blue-500 text-white py-2 px-4 rounded-md"
        >
          Next
        </button>
      </div>
    </form>

    <!-- Step 2: Store Information -->
    <form
      v-if="currentStep === 2"
      @submit.prevent="nextStep"
      class="w-full max-w-md bg-red-50 rounded-md p-4 border-red-800 border"
    >
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600"
          >Store Name</label
        >
        <input
          v-model="storeName"
          type="text"
          class="mt-1 p-2 w-full border rounded-md"
          required
        />
      </div>
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600"
          >Store Category</label
        >
        <input
          v-model="storeCategory"
          type="text"
          class="mt-1 p-2 w-full border rounded-md"
          required
        />
      </div>
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600"
          >Store Address</label
        >
        <input
          v-model="storeAddress"
          type="text"
          class="mt-1 p-2 w-full border rounded-md"
          required
        />
      </div>
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600"
          >Store Image:</label
        >
        <input
          type="file"
          @change="previewImage"
          accept="image/*"
          class="mt-1 p-2 w-full border rounded-md"
        />
      </div>
      <img
        v-if="previewSrc"
        :src="previewSrc"
        alt="Store Image Preview"
        class="w-44 h-44"
        style="width: 10em; height: 10em"
      />
      <div class="mb-4">
        <button
          type="button"
          @click="prevStep"
          class="bg-gray-500 text-white py-2 px-4 rounded-md mr-2"
        >
          Back
        </button>
        <button
          type="submit"
          class="bg-blue-500 text-white py-2 px-4 rounded-md"
        >
          Next
        </button>
      </div>
    </form>

    <!-- Step 3: Personal Information -->
    <form
      v-if="currentStep === 3"
      @submit.prevent="signUp"
      class="w-full max-w-md bg-red-50 rounded-md p-4 border-red-800 border"
    >
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600"
          >Owner's First Name</label
        >
        <input
          v-model="name"
          type="text"
          class="mt-1 p-2 w-full border rounded-md"
          required
        />
      </div>
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600"
          >Owner's Last Name</label
        >
        <input
          v-model="lastname"
          type="text"
          class="mt-1 p-2 w-full border rounded-md"
          required
        />
      </div>
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600"
          >Email address</label
        >
        <input
          v-model="email"
          type="email"
          class="mt-1 p-2 w-full border rounded-md"
          required
        />
      </div>
      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-600">Password</label>
        <input
          v-model="password"
          type="password"
          class="mt-1 p-2 w-full border rounded-md"
          required
        />
      </div>
      <div class="mb-4">
        <button
          type="button"
          @click="prevStep"
          class="bg-gray-500 text-white py-2 px-4 rounded-md mr-2"
        >
          Back
        </button>
        <button
          type="submit"
          :disabled="loading"
          class="bg-blue-500 text-white py-2 px-4 rounded-md"
        >
          <div class="flex items-center" :class="{ 'animate-spin': loading }">
            Register
          </div>
        </button>
      </div>
    </form>

    <!-- Error Alert -->
    <ErrorAlert :error-msg="authError" @clearError="clearError" />
  </div>
</template>

<script setup>
// Import your ErrorAlert component

const currentStep = ref(1);
const companyName = ref("");
const companyType = ref("");
const taxNumber = ref("");
const companyLocation = ref("");
const storeName = ref("");
const storeCategory = ref("");
const storeAddress = ref("");
const name = ref("");
const lastname = ref("");
const email = ref("");
const password = ref("");
const loading = ref(false);
const authError = ref("");
const previewSrc = ref("");
const files = ref(null);
const companyAddressLine1 = ref("");
const companyAddressLine2 = ref("");
const companyCity = ref("");
const companyStateProvince = ref("");
const companyCountry = ref("");
const companyzipCode = ref("");

watchEffect(async () => {
  // Check if the user is already authenticated, if yes, redirect to home
  if (useSupabaseUser().value) {
    await navigateTo("/");
  }
});

const nextStep = () => {
  if (currentStep.value < 3) {
    currentStep.value++;
  }
};

const prevStep = () => {
  if (currentStep.value > 1) {
    currentStep.value--;
  }
};

const previewImage = (evt) => {
  const file = evt.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = () => {
      previewSrc.value = reader.result;
    };
    reader.readAsDataURL(file);
    files.value = [file];
  }
};

const signUp = async () => {
  loading.value = true;

  try {
    let imageUrl = null;

    if (files.value && files.value.length > 0) {
      const file = files.value[0];
      const fileExt = file.name.split(".").pop();
      const fileName = `${Math.random()}.${fileExt}`;
      const filePath = `images/${fileName}`;

      const { error: uploadError, data: response } = await supabase.storage
        .from("butik1")
        .upload(filePath, file);

      if (uploadError) throw uploadError;

      imageUrl = response?.path.toString();
    }

    const { error } = await client.auth.signUp({
      email: email.value,
      password: password.value,
      options: {
        data: {
          first_name: name.value,
          last_name: lastname.value,
          company: companyName.value,
          company_type: companyType.value,
          tax_number: taxNumber.value,
          company_location: companyLocation.value,
          shop_name: storeName.value,
          shop_category: storeCategory.value,
          shop_address: storeAddress.value,
          shop_image_url: imageUrl,
        },
      },
    });

    if (error) {
      throw error;
    }

    // ... rest of your success handling code ...
  } catch (error) {
    loading.value = false;
    authError.value = "Failed to register";
    console.error(error);
  }
};

const clearError = () => {
  authError.value = "";
};
</script>
