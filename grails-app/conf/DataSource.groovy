dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
        }
    }

    // cloudbees
    production {
        dataSource {
            dbCreate = "create-drop"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "infiando-mysql"
            password = "tucohugo"
            url = "jdbc:mysql://.…......................./infiando"
            // :3306/useUnicode=true&characterEncoding=UTF-8"
            // url = "jdbc:hsqldb:file:prodDb;shutdown=true"
        }
    }

//    production {
//        dataSource {
//            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE"
//        }
//    }
}
