/*
  Warnings:

  - You are about to drop the column `bookId` on the `Borrow` table. All the data in the column will be lost.
  - You are about to drop the column `memberId` on the `Borrow` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[memberCode,bookCode]` on the table `Borrow` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `bookCode` to the `Borrow` table without a default value. This is not possible if the table is not empty.
  - Added the required column `memberCode` to the `Borrow` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Books" DROP CONSTRAINT "Books_borrowedby_fkey";

-- DropForeignKey
ALTER TABLE "Borrow" DROP CONSTRAINT "Borrow_bookId_fkey";

-- DropForeignKey
ALTER TABLE "Borrow" DROP CONSTRAINT "Borrow_memberId_fkey";

-- DropIndex
DROP INDEX "Borrow_memberId_bookId_key";

-- AlterTable
ALTER TABLE "Borrow" DROP COLUMN "bookId",
DROP COLUMN "memberId",
ADD COLUMN     "bookCode" TEXT NOT NULL,
ADD COLUMN     "memberCode" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Borrow_memberCode_bookCode_key" ON "Borrow"("memberCode", "bookCode");

-- AddForeignKey
ALTER TABLE "Books" ADD CONSTRAINT "Books_borrowedby_fkey" FOREIGN KEY ("borrowedby") REFERENCES "Members"("code") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Borrow" ADD CONSTRAINT "Borrow_memberCode_fkey" FOREIGN KEY ("memberCode") REFERENCES "Members"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Borrow" ADD CONSTRAINT "Borrow_bookCode_fkey" FOREIGN KEY ("bookCode") REFERENCES "Books"("code") ON DELETE RESTRICT ON UPDATE CASCADE;
