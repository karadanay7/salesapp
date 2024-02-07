import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  const body = await readBody(event);

  const product = await prisma.stores.create({
    data: {
      title: body.title,
      description: body.description,
      categoryId: body.categoryId,
      price: body.price,
      image: body.image,
      stockQuantity: body.stockQuantity,
    },
  });

  return product;
});
