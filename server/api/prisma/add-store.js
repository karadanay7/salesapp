import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  const body = await readBody(event);

  const store = await prisma.store.create({
    data: {
      userId: body.userId,
      isApproved: body.isApproved,
      nameSurname: body.nameSurname,
      companyTypeId: body.companyTypeId,
      idTaxNo: body.idTaxNo,
      companyName: body.companyName,
      city: body.city,
      district: body.district,
      addressLine: body.addressLine,
      phone: body.phone,
      categoryId: body.categoryId,
      url: body.url,
    },
  });

  return store;
});
