-- CreateTable
CREATE TABLE "SaleCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "SaleCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_SaleToSaleCategory" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "SaleCategory_name_key" ON "SaleCategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_SaleToSaleCategory_AB_unique" ON "_SaleToSaleCategory"("A", "B");

-- CreateIndex
CREATE INDEX "_SaleToSaleCategory_B_index" ON "_SaleToSaleCategory"("B");

-- AddForeignKey
ALTER TABLE "_SaleToSaleCategory" ADD CONSTRAINT "_SaleToSaleCategory_A_fkey" FOREIGN KEY ("A") REFERENCES "Sale"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SaleToSaleCategory" ADD CONSTRAINT "_SaleToSaleCategory_B_fkey" FOREIGN KEY ("B") REFERENCES "SaleCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;
