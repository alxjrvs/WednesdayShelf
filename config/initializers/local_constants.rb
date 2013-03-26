BASE_URL = "https://retailerservices.diamondcomics.com"

LOGIN_URL = "https://retailerservices.diamondcomics.com/Login/Login"

NEW_RELEASE_ARRAY = [["/FileExport/Misc/MasterDataFile-ITEMS.txt", "/FileExport/MonthlyToolsTXT/previewsDB.txt"]]

BACKLOG_ARRAY = [
    ["/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-ITEMS_201208.txt", "/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201208.TXT"],
    ["/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-ITEMS_201209.txt", "/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201209.TXT"],
    ["/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-Items_201210.txt","/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201210.TXT"],
    ["/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-ITEMS_201211.txt", "/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201211.TXT"],
    ["/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-ITEMS_201212.txt","/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201212.TXT"],
    ["/Downloads/Archives/monthlytools/previews_master_data_file/MasterDataFile-ITEMS_201301.txt","/Downloads/Archives/monthlytools/previews_product_copy/previewsDB_201301.TXT"],
  ]

COMBINED_ARRAY = BACKLOG_ARRAY + NEW_RELEASE_ARRAY

MASTER_AGENT = LoginAgent.new.login
