import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  let companyType = await prisma.companyType.findFirst({
    where: { id: Number(event.context.params.id) },
  });
  return companyType;
});
