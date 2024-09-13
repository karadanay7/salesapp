import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  const searchQuery = event.context.params.id;

  // Search in the Sale table
  const sales = await prisma.sale.findMany({
    where: {
      description: {
        contains: searchQuery,
        mode: "insensitive",
      },
    },
  
  });

  // Search in the Store table
  const stores = await prisma.store.findMany({
    where: {
      companyName: {
        contains: searchQuery,
        mode: "insensitive",
      },
    },
  });

  // Search in the Category table
  const categories = await prisma.category.findMany({
    where: {
      name: {
        contains: searchQuery,
        mode: "insensitive",
      },
    },
   
  });

  // Combine the results if needed (optional)
  const results = {
    sales,
    stores,
    categories,
  };

  return results;
});
