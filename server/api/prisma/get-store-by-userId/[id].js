import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  let store = await prisma.store.findFirst({
    where: { userId: Number(event.context.params.userId) },
  });
  return store;
});
