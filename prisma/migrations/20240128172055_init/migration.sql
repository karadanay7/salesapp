-- CreateTable
CREATE TABLE "Shops" (
    "id" SERIAL NOT NULL,
    "ownerName" TEXT NOT NULL,
    "ownerSurname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "shopCategory" TEXT NOT NULL,
    "companyType" TEXT NOT NULL,
    "taxNumber" TEXT NOT NULL,
    "companyLocation" TEXT NOT NULL,
    "shopAddress" TEXT NOT NULL,
    "shopImageUrl" TEXT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "categoryId" INTEGER,

    CONSTRAINT "Shops_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sales" (
    "id" SERIAL NOT NULL,
    "shopId" INTEGER NOT NULL,
    "shopName" TEXT NOT NULL,
    "saleDescription" TEXT NOT NULL,
    "salePercentage" INTEGER NOT NULL,
    "saleProducts" TEXT[],
    "shopAddress" TEXT NOT NULL,
    "saleTimespanDays" TEXT[],
    "saleTimespanHours" TEXT NOT NULL,
    "saleImageUrl" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Sales_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShopRegistrationRequests" (
    "id" SERIAL NOT NULL,
    "shopId" INTEGER,
    "ownerName" TEXT NOT NULL,
    "ownerSurname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "shopCategory" TEXT NOT NULL,
    "companyType" TEXT NOT NULL,
    "taxNumber" TEXT NOT NULL,
    "companyLocation" TEXT NOT NULL,
    "shopAddress" TEXT NOT NULL,
    "shopImageUrl" TEXT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ShopRegistrationRequests_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Categories" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_SalesToShops" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Shops_email_key" ON "Shops"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Shops_taxNumber_key" ON "Shops"("taxNumber");

-- CreateIndex
CREATE UNIQUE INDEX "ShopRegistrationRequests_email_key" ON "ShopRegistrationRequests"("email");

-- CreateIndex
CREATE UNIQUE INDEX "ShopRegistrationRequests_taxNumber_key" ON "ShopRegistrationRequests"("taxNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Categories_name_key" ON "Categories"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_SalesToShops_AB_unique" ON "_SalesToShops"("A", "B");

-- CreateIndex
CREATE INDEX "_SalesToShops_B_index" ON "_SalesToShops"("B");

-- AddForeignKey
ALTER TABLE "Shops" ADD CONSTRAINT "Shops_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SalesToShops" ADD CONSTRAINT "_SalesToShops_A_fkey" FOREIGN KEY ("A") REFERENCES "Sales"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SalesToShops" ADD CONSTRAINT "_SalesToShops_B_fkey" FOREIGN KEY ("B") REFERENCES "Shops"("id") ON DELETE CASCADE ON UPDATE CASCADE;
