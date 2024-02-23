/*
  Warnings:

  - You are about to drop the column `avaibleAt` on the `Sale` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Sale" DROP COLUMN "avaibleAt",
ADD COLUMN     "available" TEXT[];
