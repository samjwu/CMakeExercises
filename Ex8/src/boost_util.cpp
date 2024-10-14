#include "boost_util.h"

#include <boost/filesystem.hpp>

bool BoostUtil::DoesFileExist(const std::string& path)
{
    boost::filesystem::path filePath(path);

    return boost::filesystem::exists(filePath);
}
