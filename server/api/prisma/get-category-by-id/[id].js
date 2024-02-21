import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  let category = await prisma.category.findFirst({
    where: { id: Number(event.context.params.id) },
  });
  return category;
});
