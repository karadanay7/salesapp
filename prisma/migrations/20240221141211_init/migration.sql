/*
  Warnings:

  - You are about to drop the column `shopCategory` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `shopImageUrl` on the `Store` table. All the data in the column will be lost.
  - Added the required column `url` to the `Store` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Store" DROP COLUMN "shopCategory",
DROP COLUMN "shopImageUrl",
ADD COLUMN     "url" TEXT NOT NULL;
