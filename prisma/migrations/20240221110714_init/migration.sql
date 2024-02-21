/*
  Warnings:

  - You are about to drop the `Categories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Sales` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ShopRegistrationRequests` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Shops` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_SalesToShops` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Shops" DROP CONSTRAINT "Shops_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "_SalesToShops" DROP CONSTRAINT "_SalesToShops_A_fkey";

-- DropForeignKey
ALTER TABLE "_SalesToShops" DROP CONSTRAINT "_SalesToShops_B_fkey";

-- DropTable
DROP TABLE "Categories";

-- DropTable
DROP TABLE "Sales";

-- DropTable
DROP TABLE "ShopRegistrationRequests";

-- DropTable
DROP TABLE "Shops";

-- DropTable
DROP TABLE "_SalesToShops";

-- CreateTable
CREATE TABLE "Store" (
    "id" SERIAL NOT NULL,
    "userId" UUID NOT NULL,
    "isApproved" BOOLEAN NOT NULL DEFAULT false,
    "nameSurname" TEXT NOT NULL,
    "companyType" TEXT NOT NULL,
    "idTaxNo" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "shopCategory" TEXT NOT NULL,
    "companyName" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "addressLine" TEXT NOT NULL,
    "shopImageUrl" TEXT,
    "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "categoryId" INTEGER,

    CONSTRAINT "Store_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sale" (
    "id" SERIAL NOT NULL,
    "storeId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "percentage" INTEGER,
    "products" TEXT[],
    "timespanDays" TEXT[],
    "timespanHours" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Sale_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Store_idTaxNo_key" ON "Store"("idTaxNo");

-- CreateIndex
CREATE UNIQUE INDEX "Store_phoneNumber_key" ON "Store"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Category_name_key" ON "Category"("name");

-- AddForeignKey
ALTER TABLE "Store" ADD CONSTRAINT "Store_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sale" ADD CONSTRAINT "Sale_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
