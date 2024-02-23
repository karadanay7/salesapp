/*
  Warnings:

  - Changed the type of `timespanDays` on the `Sale` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `timespanHours` on the `Sale` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "Sale" DROP COLUMN "timespanDays",
ADD COLUMN     "timespanDays" TIMESTAMP(3) NOT NULL,
DROP COLUMN "timespanHours",
ADD COLUMN     "timespanHours" TIMESTAMP(3) NOT NULL;
