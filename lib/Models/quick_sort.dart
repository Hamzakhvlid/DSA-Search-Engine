

class Quicksorting {
  List list;
  Quicksorting(this.list);

  void swap(list, int i, int j) {
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }

  int partition(list, int low, int high) {
    int pivot = list[high];
    int i = low - 1;

    for (int j = low; j < high; j++) {
      if (list[j] <= pivot) {
        i++;
        swap(list, i, j);
      }
      swap(list, i + 1, high);
    }
    return i + 1;
  }

  void quickSort(List list, int low, int high) {
    if (low < high) {
      int pi = partition(list, low, high);
      quickSort(list, low, pi - 1);
      quickSort(list, pi + 1, high);
    }
  }
}
