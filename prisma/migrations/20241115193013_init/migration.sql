-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "nonce" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT false,
    "wallet_address" TEXT NOT NULL DEFAULT '',
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "private_key" TEXT,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_wallet_address_key" ON "users"("wallet_address");
