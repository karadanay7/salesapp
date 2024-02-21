/*
  Warnings:

  - You are about to drop the column `companyType` on the `Store` table. All the data in the column will be lost.
  - Added the required column `companyTypeId` to the `Store` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Store" DROP COLUMN "companyType",
ADD COLUMN     "companyTypeId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "CompanyType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "CompanyType_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "CompanyType_name_key" ON "CompanyType"("name");

-- AddForeignKey
ALTER TABLE "Store" ADD CONSTRAINT "Store_companyTypeId_fkey" FOREIGN KEY ("companyTypeId") REFERENCES "CompanyType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
