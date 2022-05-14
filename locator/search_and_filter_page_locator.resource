*** Variables ***
# Locator
${search_url_locator}   https://inkr.com/search?text={search_text}
${btn_turn_off_notification}    //span[contains(text(), "Not now")]
${filter_param_locator}     //input[@value="{filter_param}"]
${manga_filter_locator}     //input[@value="manga"]
${age_information_locator}     //div[@class="ant-row"]/div[2]/div[1]/div[6]/div[3]
${style_origin_locator}    //div[@class="ant-row"]/div[2]/div[1]/div[6]/div[6]
${release_status_locator}     //div[@role="tabpanel"]/div/div[2]
${show_more_locator}    //span[contains(text(), 'Show More')]
${count_reading_list_locator}     //div[@class="ant-row"]/div
${book_locator}     //div[@class="ant-row"]/div[{index}]



