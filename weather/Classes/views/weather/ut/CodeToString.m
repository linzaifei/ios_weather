//
//  CodeToString.m
//  weather
//
//  Created by zifei on 2021/3/3.
//

#import "CodeToString.h"

@implementation CodeToString
+(id)getWith:(int)code{

    id x = 0;
    switch (code) {
        case 154: x = ic_154; break;
        case 308: x = ic_308; break;
        case 318: x = ic_318; break;
        case 900: x = ic_900; break;
        case 509: x = ic_509; break;
        case 457: x = ic_457; break;
        case 309: x = ic_309; break;
        case 456: x = ic_456; break;
        case 901: x = ic_901; break;
        case 508: x = ic_508; break;
        case 307: x = ic_307; break;
        case 306: x = ic_306; break;
        case 304: x = ic_304; break;
        case 310: x = ic_310; break;
        case 305: x = ic_305; break;
        case 100: x = ic_100; break;
        case 303: x = ic_303; break;
        case 302: x = ic_302; break;
        case 104: x = ic_104; break;
        case 501: x = ic_501; break;
        case 514: x = ic_514; break;
        case 515: x = ic_515; break;
        case 313: x = ic_313; break;
        case 502: x = ic_502; break;
        case 312: x = ic_312; break;
        case 311: x = ic_311; break;
        case 507: x = ic_507; break;
        case 315: x = ic_315; break;
        case 103: x = ic_103; break;
        case 102: x = ic_102; break;
        case 512: x = ic_512; break;
        case 513: x = ic_513; break;
        case 500: x = ic_500; break;
        case 316: x = ic_316; break;
        case 300: x = ic_300; break;
        case 511: x = ic_511; break;
        case 499: x = ic_499; break;
        case 510: x = ic_510; break;
        case 314: x = ic_314; break;
        case 317: x = ic_317; break;
        case 402: x = ic_402; break;
        case 399: x = ic_399; break;
        case 401: x = ic_401; break;
        case 400: x = ic_400; break;
        case 503: x = ic_503; break;
        case 101: x = ic_101; break;
        case 404: x = ic_404; break;
        case 504: x = ic_504; break;
        case 405: x = ic_405; break;
        case 407: x = ic_407; break;
        case 410: x = ic_410; break;
        case 153: x = ic_153; break;
        case 406: x = ic_406; break;
        case 999: x = ic_999; break;
        case 150: x = ic_150; break;
        case 351: x = ic_351; break;
        case 403: x = ic_403; break;
        case 350: x = ic_350; break;
        case 409: x = ic_409; break;
        case 408: x = ic_408; break;
        default:
            break;
    }
    
    return x;
}
@end
