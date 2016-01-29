#ifndef ES_ORIENTATION_H
#define ES_ORIENTATION_H

namespace EsOrientation {
    #if defined(IPHONE)
    void setRequestedOrientation(int screenOrientation);
    #endif
}

#endif
