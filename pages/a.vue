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
import type { FormSubmitEvent } from "@nuxt/ui/dist/runtime/types";
import { z } from "zod";
const supabase = useSupabaseClient();
const RegisterValidationSchema = z
  .object({
    email: z.string().email("Invalid email"),
    password: z
      .string()
      .regex(new RegExp(".*[A-Z].*"), "One uppercase character")
      .regex(new RegExp(".*[a-z].*"), "One lowercase character")
      .regex(new RegExp(".*\\d.*"), "One number")
      .regex(
        new RegExp(".*[`~<>?,./!@#$%^&*()\\-_+=\"'|{}\\[\\];:\\\\].*"),
        "One special character"
      )
      .min(8, "Must be at least 8 characters in length"),
    confirmPassword: z
      .string()
      .regex(new RegExp(".*[A-Z].*"), "One uppercase character")
      .regex(new RegExp(".*[a-z].*"), "One lowercase character")
      .regex(new RegExp(".*\\d.*"), "One number")
      .regex(
        new RegExp(".*[`~<>?,./!@#$%^&*()\\-_+=\"'|{}\\[\\];:\\\\].*"),
        "One special character"
      )
      .min(8, "Must be at least 8 characters in length"),
  })
  .refine((data) => data.password === data.confirmPassword, {
    message: "Passwords don't match",
    path: ["confirmPassword"], // path of error
  });

const formState = ref({
  email: "",
  password: "",
  confirmPassword: "",
});

// Return true if there are no errors, false otherwise

function handleFormSubmit(
  event: FormSubmitEvent<z.output<typeof RegisterValidationSchema>>
) {
  // Do something with data
  console.log(event.data);
}
// Function to check if passwords match
</script>
