export class TennisGame3 {
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
    if (this.p1 === this.p2 && this.p1 <= 2) {
      return `${this.description(this.p1)}-All`;
    }
    if (this.p1 === this.p2) {
      return "Deuce";
    }
    if (Math.max(this.p1, this.p2) <= 3) {
      return `${this.description(this.p1)}-${this.description(this.p2)}`;
    }
    if (Math.abs(this.p1 - this.p2) === 1) {
      return `Advantage ${this.leader()}`;
    }
    return `Win for ${this.leader()}`;
  }

  description(points) {
    return ["Love", "Fifteen", "Thirty", "Forty"][points];
  }

  leader() {
    return this.p1 > this.p2 ? this.name1 : this.name2;
  }
}
