
class Score {
    int right= 0;
    int wrong = 0;

    Score();

    String text() { return 'Rigth/wrong: $right/$wrong'; }

    void updateRight() {
      right++;
    }

    void updateWrong() {
      wrong++;
    }

}