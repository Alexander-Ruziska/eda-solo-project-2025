import { render, screen } from "@testing-library/react";
import HomePage from "../src/components/HomePage/HomePage"; // Adjust the path as needed



describe("HomePage Component", () => {
  test("Homepage renders", () => {
    render(<HomePage />);
    expect(screen.getByText('Home Page')).toBeDefined();
    expect(screen.getByRole("button", { name: /log out/i })).toBeDefined();
  });
});
