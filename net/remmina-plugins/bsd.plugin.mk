.if defined(PKGNAMESUFFIX)

PORTNAME=	remmina-plugin
PATCHDIR=	${.CURDIR}/../remmina/files

LICENSE=	GPLv2

BUILD_DEPENDS+=	remmina>=${PORTVERSION}:${PORTSDIR}/net/remmina
RUN_DEPENDS+=	remmina>=${PORTVERSION}:${PORTSDIR}/net/remmina

USES=		cmake gmake pkgconfig
USE_GNOME=	atk desktopfileutils gdkpixbuf2 glib20 gtk20 pango
INSTALLS_ICONS=	yes
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}
CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
CFLAGS+=	-I${WRKSRC}/remmina/include -I${LOCALBASE}/include ${PTHREAD_CFLAGS} -fPIC
WRKSRC=		${WRKDIR}/${GH_ACCOUNT}-Remmina-${GH_COMMIT}

# disable appindicator as it is new feature of gnome 3
CMAKE_ARGS+=    -DWITH_APPINDICATOR=OFF
# set build directory
CMAKE_ARGS+=    --build=build
# prefer gtk2 rather than gtk3
CMAKE_ARGS+=    -DGTK_VERSION=2

SSH_DESC=	Build with SSH tunneling support

.include <bsd.port.options.mk>

.include <bsd.port.pre.mk>

.if ${PKGNAMESUFFIX} == "-i18n" || ${PKGNAMESUFFIX} == "-gnome"
PLIST=		${.CURDIR}/pkg-plist
.else
PLIST_SUB+=	PLUGIN="${PKGNAMESUFFIX:S,-,,}"
PLIST=		${PKGDIR}/pkg-plist.plugin
.endif

post-patch:
	@# do not build remmina core program
	${REINPLACE_CMD} -e 's|add_subdirectory(remmina)||' ${WRKSRC}/CMakeLists.txt
	${REINPLACE_CMD} -e 's|find_suggested_package(AVAHI)||' ${WRKSRC}/CMakeLists.txt
	@# which plugins to build
.if ${PKGNAMESUFFIX:S,-,,} != "nx"
	${REINPLACE_CMD} -e 's|find_suggested_package(LIBSSH)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
	${REINPLACE_CMD} -e 's|find_required_package(XKBFILE)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
	${REINPLACE_CMD} -e 's|add_subdirectory(nx)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
.endif
.if ${PKGNAMESUFFIX:S,-,,} != "gnome"
	${REINPLACE_CMD} -e 's|add_subdirectory(remmina-plugins-gnome)||' ${WRKSRC}/CMakeLists.txt
.endif
.if ${PKGNAMESUFFIX:S,-,,} != "rdp"
	${REINPLACE_CMD} -e 's|find_suggested_package(FREERDP)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
	${REINPLACE_CMD} -e 's|add_subdirectory(rdp)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
.endif
.if ${PKGNAMESUFFIX:S,-,,} != "vnc"
	${REINPLACE_CMD} -e 's|find_suggested_package(GCRYPT)||' ${WRKSRC}/CMakeLists.txt
	${REINPLACE_CMD} -e' s|find_required_package(LIBVNCSERVER)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
	${REINPLACE_CMD} -e 's|add_subdirectory(vnc)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
.endif
.if ${PKGNAMESUFFIX:S,-,,} != "xdmcp"
	${REINPLACE_CMD} -e 's|add_subdirectory(xdmcp)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
.endif
.if ${PKGNAMESUFFIX:S,-,,} != "telepathy"
	${REINPLACE_CMD} -e 's|find_suggested_package(TELEPATHY)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
	${REINPLACE_CMD} -e 's|add_subdirectory(telepathy)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
.endif
.if ${PKGNAMESUFFIX:S,-,,} != "i18n"
	${REINPLACE_CMD} -e 's|add_subdirectory(po)||' ${WRKSRC}/remmina-plugins/CMakeLists.txt
.endif

.include <bsd.port.post.mk>
.endif
