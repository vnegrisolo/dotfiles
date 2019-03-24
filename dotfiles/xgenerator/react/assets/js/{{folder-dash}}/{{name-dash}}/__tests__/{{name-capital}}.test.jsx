import React from "react"
import { shallow } from "enzyme"
import {{name-capital}} from "../{{name-capital}}.jsx"

it("renders component", () => {
  const component = shallow(<{{name-capital}} />)
  expect(component).toMatchSnapshot()
})
