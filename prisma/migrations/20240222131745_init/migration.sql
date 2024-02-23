/*
  Warnings:

  - Made the column `percentage` on table `Sale` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Sale" ALTER COLUMN "percentage" SET NOT NULL;
