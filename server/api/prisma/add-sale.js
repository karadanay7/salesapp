import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  const body = await readBody(event);

  const sale = await prisma.sale.create({
    data: {
      storeId: body.storeId,
      name: body.name,
      description: body.description,
      percentage: body.percentage,
      products: body.products,
      timespanStart: body.timespanStart,
      timespanEnd: body.timespanEnd,
      url: body.url,
      available: body.available,
    },
  });

  return sale;
});
