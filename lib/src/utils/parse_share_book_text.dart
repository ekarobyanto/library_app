parseShareBookText(String shareBook) {
  return shareBook.replaceAll("{{<<>>%%^}}", '');
}
