import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  let store = await prisma.store.findFirst({
    where: { saleId: Number(event.context.params.saleId) },
  });
  return store;
});
