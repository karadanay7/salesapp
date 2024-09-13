import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  let store = await prisma.store.findFirst({
    where: { id: Number(event.context.params.id) },
  });
  return store;
});
