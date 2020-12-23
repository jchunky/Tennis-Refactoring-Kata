export class TennisGame2 {
  constructor(name1, name2) {
    this.name1 = name1;
    this.name2 = name2;
    this.p1 = 0;
    this.p2 = 0;
  }

  getScore() {
    if (this.p1 === this.p2 && this.p1 <= 2) {
      return this.description(this.p1) + "-All";
    } else if (this.p1 === this.p2) {
      return "Deuce";
    } else if (Math.max(this.p1, this.p2) <= 3) {
      return this.description(this.p1) + "-" + this.description(this.p2);
    } else if (Math.abs(this.p1 - this.p2) === 1) {
      return "Advantage " + this.leader();
    } else {
      return "Win for " + this.leader();
    }
  }

  wonPoint(name) {
    name === this.name1 ? (this.p1 += 1) : (this.p2 += 1);
  }

  description(points) {
    return ["Love", "Fifteen", "Thirty", "Forty"][points];
  }

  leader() {
    return this.p1 > this.p2 ? this.name1 : this.name2;
  }
}
