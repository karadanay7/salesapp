import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  let sale = await prisma.sale.findMany();
  return sale;
});
