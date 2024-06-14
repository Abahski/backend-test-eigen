/*
  Warnings:

  - You are about to drop the column `penalty` on the `Members` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Members" DROP COLUMN "penalty",
ADD COLUMN     "penaltyUntil" TIMESTAMP(3);
