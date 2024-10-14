#include <boost/filesystem.hpp>

#include <string>

#ifndef BOOST_UTIL_H_
#define BOOST_UTIL_H_

class BoostUtil
{
public:
    bool DoesFileExist(const std::string& path);
};

#endif
