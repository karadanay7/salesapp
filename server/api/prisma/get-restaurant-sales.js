import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  // Fetch sales only from stores that belong to category with id = 7
  let restaurantSales = await prisma.sale.findMany({
    where: {
      store: {
        categoryId: 1,
      },
    },
    include: {
      store: {
        select: {
          companyName: true,
          city: true,
          district: true,
          street: true,
          addressLine: true,
        },
      } ,
    },
  });

  return restaurantSales;
});
