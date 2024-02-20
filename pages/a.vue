<template>
  <div
    class="flex flex-col items-center place-content-start bg-gray-100 min-h-screen"
  >
    <UCard class="max-w-[800px]">
      <UH #header>
        <h1>Register</h1>
      </UH>
      <UForm
        :schema="RegisterValidationSchema"
        :state="formState"
        class="space-y-4 flex flex-col items-center"
        @submit="handleFormSubmit"
      >
        <div class="grid grid-cols-2 gap-7">
          <div>
            <UFormGroup label="Email" name="email">
              <UInput v-model="formState.email" type="text" />
            </UFormGroup>

            <UFormGroup label="Password" name="password">
              <UInput v-model="formState.password" type="password" />
            </UFormGroup>
            <UFormGroup label="Confirm Password" name="confirmPassword">
              <UInput v-model="formState.confirmPassword" type="password" />
            </UFormGroup>
          </div>
          <div>
            <UFormGroup label="Email" name="email">
              <UInput v-model="formState.email" type="text" />
            </UFormGroup>

            <UFormGroup label="Password" name="password">
              <UInput v-model="formState.password" type="password" />
            </UFormGroup>
            <UFormGroup label="Confirm Password" name="confirmPassword">
              <UInput v-model="formState.confirmPassword" type="password" />
            </UFormGroup>
          </div>
        </div>
        <UButton type="submit">Register </UButton>
      </UForm>
    </UCard>
  </div>
</template>

<script setup lang="ts">
const supabase = useSupabaseClient();

const formState = ref({
  email: "",
  password: "",
  confirmPassword: "",
});

// Return true if there are no errors, false otherwise

// Function to check if passwords match
</script>
