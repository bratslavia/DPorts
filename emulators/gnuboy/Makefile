# Created by: Ying-Chieh Liao <ijliao@FreeBSD.org>
# $FreeBSD$

PORTNAME=	gnuboy
PORTVERSION=	1.0.3
PORTREVISION=	11
CATEGORIES=	emulators games
MASTER_SITES=	http://www.sourcefiles.org/Emulators/Videogames/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Nintendo GameBoy emulator

LICENSE=	GPLv2 # (or later)

LIB_DEPENDS=	libvga.so:${PORTSDIR}/graphics/svgalib

USES=		autoreconf compiler
USE_SDL=	sdl
USE_XORG=	x11
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-sdl --enable-optimize=low

PORTDOCS=	*
PLIST_FILES=	bin/sdlgnuboy bin/sgnuboy bin/xgnuboy

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

.if ${COMPILER_TYPE} == "clang"
CONFIGURE_ARGS+=--disable-asm
.endif

do-install:
.for i in sdlgnuboy sgnuboy xgnuboy
	(cd ${WRKSRC} && ${INSTALL_PROGRAM} ${i} ${STAGEDIR}${PREFIX}/bin)
.endfor
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC}/docs && ${INSTALL_DATA} * ${STAGEDIR}${DOCSDIR})

.include <bsd.port.post.mk>
