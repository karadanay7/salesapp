/*
  Warnings:

  - You are about to drop the column `timespanDays` on the `Sale` table. All the data in the column will be lost.
  - You are about to drop the column `timespanHours` on the `Sale` table. All the data in the column will be lost.
  - Added the required column `timespanEnd` to the `Sale` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timespanStart` to the `Sale` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Sale" DROP COLUMN "timespanDays",
DROP COLUMN "timespanHours",
ADD COLUMN     "timespanEnd" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "timespanStart" TIMESTAMP(3) NOT NULL;
