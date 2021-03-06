# Created by: Jaosn Helfman <jgh@FreeBSD.org>
# $FreeBSD$

PORTNAME=	xpad
PORTVERSION=	4.5.0
PORTREVISION=	1
CATEGORIES=	deskutils
MASTER_SITES=	http://launchpad.net/${PORTNAME}/trunk/4.5/+download/

MAINTAINER=	jgh@FreeBSD.org
COMMENT=	Virtual note-pad system for your X11 desktop

LICENSE=	GPLv3

RUN_DEPENDS=	gnome-icon-theme>=0:${PORTSDIR}/misc/gnome-icon-theme

OPTIONS_DEFINE=	NLS DOCS
OPTIONS_SUB=	yes

CONFLICTS_INSTALL=	xpad3-[0-9]*
USE_XORG=	x11 sm
USE_GNOME=	gtk30 intltool gtksourceview3
USES=	pkgconfig gmake tar:bzip2 autoreconf
INSTALLS_ICONS=	yes
CPPFLAGS+=	${CXXFLAGS} -I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
PORTDOCS=	*

NLS_USES=		gettext
NLS_CONFIGURE_ENABLE=	nls

.include <bsd.port.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|glib/glist.h|glib.h|g' \
		${WRKSRC}/src/xpad-undo.c

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for doc in AUTHORS ChangeLog INSTALL NEWS README TODO THANKS
	${INSTALL_DATA} ${WRKSRC}/${doc} ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
