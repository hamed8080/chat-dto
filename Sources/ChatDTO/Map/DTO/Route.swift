//
// Route.swift
// Copyright (c) 2022 ChatDTO
//
// Created by Hamed Hosseini on 12/14/22

import Foundation

public struct Route: Decodable {
    public var overviewPolyline: OverviewPolyline?
    public var legs: [Leg]?

    private enum CodingKeys: String, CodingKey {
        case overviewPolyline = "overview_polyline"
        case legs
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.overviewPolyline = try container.decodeIfPresent(OverviewPolyline.self, forKey: .overviewPolyline)
        self.legs = try container.decodeIfPresent([Leg].self, forKey: .legs)
    }
}

public struct Leg: Decodable {
    public var summary: String?
    public var distance: Distance?
    public var duration: Duration?
    public var steps: [Step]?

    private enum CodingKeys: CodingKey {
        case summary
        case distance
        case duration
        case steps
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.summary = try container.decodeIfPresent(String.self, forKey: .summary)
        self.distance = try container.decodeIfPresent(Distance.self, forKey: .distance)
        self.duration = try container.decodeIfPresent(Duration.self, forKey: .duration)
        self.steps = try container.decodeIfPresent([Step].self, forKey: .steps)
    }
}

public struct OverviewPolyline: Decodable {
    public var points: String?

    private enum CodingKeys: CodingKey {
        case points
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.points = try container.decodeIfPresent(String.self, forKey: .points)
    }
}

public struct Distance: Decodable {
    public var value: Double?
    public var text: String?

    private enum CodingKeys: CodingKey {
        case value
        case text
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decodeIfPresent(Double.self, forKey: .value)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
    }
}

public struct Duration: Decodable {
    public var value: Double?
    public var text: String?

    public enum CodingKeys: CodingKey {
        case value
        case text
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decodeIfPresent(Double.self, forKey: .value)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
    }
}

public struct Step: Decodable {
    public var name: String?
    public var instruction: String?
    public var rotaryName: String?
    public var distance: Distance?
    public var duration: Duration?
    public var startLocation: [Double]?
    public var maneuver: String?

    private enum CodingKeys: String, CodingKey {
        case name
        case instruction
        case rotaryName
        case distance
        case duration
        case startLocation = "start_location"
        case maneuver
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.instruction = try container.decodeIfPresent(String.self, forKey: .instruction)
        self.rotaryName = try container.decodeIfPresent(String.self, forKey: .rotaryName)
        self.distance = try container.decodeIfPresent(Distance.self, forKey: .distance)
        self.duration = try container.decodeIfPresent(Duration.self, forKey: .duration)
        self.startLocation = try container.decodeIfPresent([Double].self, forKey: .startLocation)
        self.maneuver = try container.decodeIfPresent(String.self, forKey: .maneuver)
    }
}
