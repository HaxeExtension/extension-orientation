#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>
#include "EsOrientation.h"

using namespace EsOrientation;

static value es_orientation_set_requested_orientation(value screenOrientation) {
    #if defined(IPHONE)
    setRequestedOrientation(val_int(screenOrientation));
    #endif

    return alloc_null();
}

extern "C" void es_orientation_main() {
    val_int(0); // Fix Neko init
}

extern "C" int es_orientation_register_prims() {
    return 0;
}

DEFINE_PRIM(es_orientation_set_requested_orientation, 1);
DEFINE_ENTRY_POINT(es_orientation_main);
