/*
  Warnings:

  - You are about to drop the `SaleCategory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_SaleToSaleCategory` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_SaleToSaleCategory" DROP CONSTRAINT "_SaleToSaleCategory_A_fkey";

-- DropForeignKey
ALTER TABLE "_SaleToSaleCategory" DROP CONSTRAINT "_SaleToSaleCategory_B_fkey";

-- DropTable
DROP TABLE "SaleCategory";

-- DropTable
DROP TABLE "_SaleToSaleCategory";
