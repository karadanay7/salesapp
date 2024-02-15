import { z } from "Zod";
export const RegisterValidationSchema = z
  .object({
    nameSurname: z.string().min(5),
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
    phone: z.number(),

    companyType: z.string(),
    companyName: z.string(),
    city: z.string(),
    district: z.string(),
    addressLine: z.string(),
    category: z.string(),
    idTaxNo: z.number(),
    selectedDistrict: z.string(),
    latestPath: z.string(),
  })
  .superRefine(({ confirmPassword, password }, ctx) => {
    if (confirmPassword !== password) {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        message: "The passwords do not match",
      });
    }
  });
export type RegisterValidationSchema = z.output<
  typeof RegisterValidationSchema
>;
