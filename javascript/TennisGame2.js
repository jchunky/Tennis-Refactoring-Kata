function score(name1, name2, p1, p2) {
  if (p1 === p2 && p1 <= 2) {
    return `${description(p1)}-All`;
  }
  if (p1 === p2) {
    return "Deuce";
  }
  if (Math.max(p1, p2) <= 3) {
    return `${description(p1)}-${description(p2)}`;
  }
  if (Math.abs(p1 - p2) === 1) {
    return `Advantage ${leader()}`;
  }
  return `Win for ${leader()}`;

  function description(points) {
    return {
      "0": "Love",
      "1": "Fifteen",
      "2": "Thirty",
      "3": "Forty"
    }[points];
  }

  function leader() {
    return p1 > p2 ? name1 : name2;
  }
}

export class TennisGame2 {
  constructor(name1, name2) {
    this.name1 = name1;
    this.name2 = name2;
    this.p1 = 0;
    this.p2 = 0;
  }

  wonPoint(name) {
    name === this.name1 ? this.p1++ : this.p2++;
  }

  getScore() {
    return score(this.name1, this.name2, this.p1, this.p2);
  }
}
