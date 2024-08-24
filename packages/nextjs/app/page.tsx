"use client";

import Image from "next/image";
import Link from "next/link";
import type { NextPage } from "next";

const Home: NextPage = () => {
  return (
    <>
      <div className="flex items-center flex-col flex-grow pt-10">
        <div className="px-5">
          <h1 className="text-center">
            <span className="block text-2xl mb-2">Welcome to</span>
            <span className="block text-4xl font-bold">Ginova</span>
          </h1>
          <Image
            className="w-[200px] h-[200px] rounded-2xl mx-auto my-8"
            src="/logo.svg"
            alt="Ginova logo"
            width={200}
            height={200}
          />
          <p className="text-center text-2xl max-w-[500px] mt-8">
            Making the circular economy more efficient and traceable than ever
          </p>
        </div>

        <div className="bg-base-300 w-full h-max mt-16 px-8 py-12">
          <div className="flex justify-center items-center gap-12 flex-col sm:flex-row">
            <div className="flex flex-col bg-base-100 p-6 px-8 text-center items-center max-w-xs rounded-full">
              <Link href="/debug" passHref className="text-2xl">
                Explore API
              </Link>
            </div>
            {/* <div className="flex flex-col bg-base-100 px-10 py-10 text-center items-center max-w-xs rounded-3xl">
              <MagnifyingGlassIcon className="h-8 w-8 fill-secondary" />
              <p>
                Explore your transactions with the{" "}
                <Link href="/blockexplorer" passHref className="link">
                  Block Explorer
                </Link>
              </p>
            </div> */}
          </div>
        </div>
      </div>
    </>
  );
};

export default Home;
