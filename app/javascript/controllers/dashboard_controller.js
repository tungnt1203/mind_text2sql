import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["sqlInput", "output"];

  optimizeSQL() {
    this.processSQL("optimize");
  }

  formatSQL() {
    this.processSQL("format");
  }

  fixQuery() {
    this.processSQL("fix");
  }

  text2SQL() {
    this.processSQL("text2sql");
  }

  explainSQL() {
    this.processSQL("explain");
  }

  processSQL(action) {
    const sql = this.sqlInputTarget.value;
    // Ở đây, bạn sẽ gửi yêu cầu AJAX đến backend để xử lý SQL
    // Đây chỉ là mô phỏng
    setTimeout(() => {
      this.outputTarget.textContent = `${action.toUpperCase()} result for: ${sql}`;
    }, 500);
  }
}
