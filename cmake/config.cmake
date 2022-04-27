hunter_config(
    Boost VERSION "1.76.0-local"
    URL
    "https://osp-1257653870.cos.ap-guangzhou.myqcloud.com/FISCO-BCOS/FISCO-BCOS/deps/boost_1_76_0.tar.bz2
    https://downloads.sourceforge.net/project/boost/boost/1.76.0/source/boost_1_76_0.tar.bz2
    https://nchc.dl.sourceforge.net/project/boost/boost/1.76.0/boost_1_76_0.tar.bz2"
    SHA1
    8064156508312dde1d834fec3dca9b11006555b6
    CMAKE_ARGS ARCH_NATIVE=ON
    CONFIG_MACRO=BOOST_UUID_RANDOM_PROVIDER_FORCE_POSIX
)

#hunter_config(bcos-utilities VERSION 1.0.0-rc1-f12788a1 CMAKE_ARGS HUNTER_PACKAGE_LOG_BUILD=ON HUNTER_PACKAGE_LOG_INSTALL=ON)
hunter_config(bcos-utilities
    VERSION 1.0.0-rc2.2.2
    URL https://${URL_BASE}/awangbrace/bcos-utilities/archive/refs/tags/v1.0.0-rc2.2.tar.gz
    SHA1 0e6e0d3276f2b7c3c49b8e26d754e9bc67a0c9f3
    CMAKE_ARGS HUNTER_PACKAGE_LOG_BUILD=ON HUNTER_PACKAGE_LOG_INSTALL=ON  URL_BASE=${URL_BASE} ARCH_NATIVE=ON
)


hunter_config(OpenSSL VERSION tassl_1.1.1b_v1.4-63b60292  CMAKE_ARGS ARCH_NATIVE=ON)
