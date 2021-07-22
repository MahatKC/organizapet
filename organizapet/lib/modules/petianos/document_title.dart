String document_title(String name) {
    List name_list = name.split(" ");
    String title = name_list[0];
    for (int i = 1; i < name_list.length; i++) {
      title += name_list[i][0];
    }

    return title;
  }