# Created by: Maxim Sobolev <sobomax@FreeBSD.org>
# $FreeBSD$

PORTNAME=	nspr
DISTVERSION=	4.10.9
CATEGORIES=	devel
MASTER_SITES=	MOZILLA/${PORTNAME}/releases/v${PORTVERSION}/src

MAINTAINER=	gecko@FreeBSD.org
COMMENT=	Platform-neutral API for system level and libc like functions

WRKSRC=		${WRKDIR}/${DISTNAME}/nspr/build

USES=		cpe gmake
CPE_VENDOR=	mozilla
CPE_PRODUCT=	netscape_portable_runtime
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	autoconf
CONFIGURE_ARGS=	--srcdir=${WRKSRC:H}
CONFIGURE_WRKSRC= ${WRKSRC}/..

MAKE_ENV=	DIST=${WRKSRC}/dist

LIBRARIES=	libnspr4.so.1 libplc4.so.1 libplds4.so.1

OPTIONS_DEFINE=	DEBUG

DEBUG_CONFIGURE_ENABLE=debug

do-configure:
	cd ${WRKSRC} && ${CONFIGURE_ENV} \
		../${CONFIGURE_SCRIPT} ${CONFIGURE_ARGS}

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/include/nspr
	${TAR} -C ${WRKSRC}/dist/include --dereference -cf - . | \
	    	${TAR} -C ${STAGEDIR}${PREFIX}/include -xof -
	${FIND} ${STAGEDIR}${PREFIX}/include/nspr -type d | \
	    	${XARGS} ${CHMOD} 0755
	${FIND} ${STAGEDIR}${PREFIX}/include/nspr -type f | \
	    	${XARGS} ${CHMOD} ${SHAREMODE}
	${TAR} -C ${WRKSRC}/dist/lib --dereference -cf - . | \
	    	${TAR} -C ${STAGEDIR}${PREFIX}/lib -xof -
	${INSTALL_SCRIPT} ${WRKSRC}/config/nspr-config ${STAGEDIR}${PREFIX}/bin
	${MKDIR} ${STAGEDIR}${PREFIX}/libdata/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/config/nspr.pc ${STAGEDIR}${PREFIX}/libdata/pkgconfig
.for lib in ${LIBRARIES}
.if defined(STRIP) && ${STRIP} != ""
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/${lib}
.endif
	${CHMOD} ${LIBMODE} ${STAGEDIR}${PREFIX}/lib/${lib}
	${LN} -sf ${lib} ${STAGEDIR}${PREFIX}/lib/${lib:R}
.endfor

prtests:
	${DO_MAKE_BUILD} -C ${WRKSRC}/pr/tests
	${LN} -sf libmy.so.1 ${WRKSRC}/pr/tests/dll/libmy.so
	cd ${WRKSRC}/pr/tests && ../../../pr/tests/runtests.sh

libtests:
	${DO_MAKE_BUILD} -C ${WRKSRC}/lib/tests
	${WRKSRC}/lib/tests/string
	${WRKSRC}/lib/tests/base64t
	# The test below is commented out, because arena requires
	# command-line arguments. If you can provide reasonable values
	# for it, please contact ${MAINTAINER}. Thank you.
	#	${WRKSRC}/lib/tests/arena
	#

test: libtests prtests

#regression-test: test

#.if defined(PACKAGE_BUILDING)
#post-build: test
#.else
post-build:
	#
	# Please, consider running ``make test'' to find any
	# possible build problems.
	#
#.endif

.include <bsd.port.mk>
