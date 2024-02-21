/*
  Warnings:

  - You are about to drop the column `phoneNumber` on the `Store` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[phone]` on the table `Store` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `phone` to the `Store` table without a default value. This is not possible if the table is not empty.
  - Made the column `categoryId` on table `Store` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Store" DROP CONSTRAINT "Store_categoryId_fkey";

-- DropIndex
DROP INDEX "Store_phoneNumber_key";

-- AlterTable
ALTER TABLE "Store" DROP COLUMN "phoneNumber",
ADD COLUMN     "phone" TEXT NOT NULL,
ALTER COLUMN "categoryId" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Store_phone_key" ON "Store"("phone");

-- AddForeignKey
ALTER TABLE "Store" ADD CONSTRAINT "Store_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
